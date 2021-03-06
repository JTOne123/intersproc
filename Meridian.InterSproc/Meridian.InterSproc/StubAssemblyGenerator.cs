﻿// ----------------------------------------------------------------------------
// <copyright file="StubAssemblyGenerator.cs" company="MTCS">
// Copyright (c) MTCS 2018.
// MTCS is a trading name of Meridian Technology Consultancy Services Ltd.
// Meridian Technology Consultancy Services Ltd is registered in England and
// Wales. Company number: 11184022.
// </copyright>
// ----------------------------------------------------------------------------

namespace Meridian.InterSproc
{
    using System;
    using System.CodeDom;
    using System.CodeDom.Compiler;
    using System.Collections.Generic;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using Meridian.InterSproc.Definitions;
    using Meridian.InterSproc.Exceptions;
    using Meridian.InterSproc.Models;
    using Microsoft.CodeAnalysis;
    using Microsoft.CodeAnalysis.CSharp;
    using Microsoft.CSharp;

    /// <summary>
    /// Implements <see cref="IStubAssemblyGenerator" />.
    /// </summary>
    public class StubAssemblyGenerator : IStubAssemblyGenerator
    {
        private readonly IAssemblyWrapperFactory assemblyWrapperFactory;
        private readonly ICSharpCompilationWrapperFactory cSharpCompilationWrapperFactory;
        private readonly IAppDomainWrapper environmentTrustedAssembliesProvider;
        private readonly IFileInfoWrapperFactory fileInfoWrapperFactory;
        private readonly ILoggingProvider loggingProvider;
        private readonly IMetadataReferenceWrapperFactory metadataReferenceWrapperFactory;
        private readonly IStubAssemblyGeneratorSettingsProvider stubAssemblyGeneratorSettingsProvider;
        private readonly IStubDomGenerator stubDomGenerator;

        /// <summary>
        /// Initialises a new instance of the
        /// <see cref="StubAssemblyGenerator" /> class.
        /// </summary>
        /// <param name="assemblyWrapperFactory">
        /// An instance of type <see cref="IAssemblyWrapperFactory" />.
        /// </param>
        /// <param name="cSharpCompilationWrapperFactory">
        /// An instance of type <see cref="ICSharpCompilationWrapper" />.
        /// </param>
        /// <param name="environmentTrustedAssembliesProvider">
        /// An instance of type
        /// <see cref="IAppDomainWrapper" />.
        /// </param>
        /// <param name="fileInfoWrapperFactory">
        /// An instance of type <see cref="IFileInfoWrapperFactory" />.
        /// </param>
        /// <param name="loggingProvider">
        /// An instance of type <see cref="ILoggingProvider" />.
        /// </param>
        /// <param name="metadataReferenceWrapperFactory">
        /// An instance of type
        /// <see cref="IMetadataReferenceWrapperFactory" />.
        /// </param>
        /// <param name="stubAssemblyGeneratorSettingsProvider">
        /// An instance of type
        /// <see cref="IStubAssemblyGeneratorSettingsProvider" />.
        /// </param>
        /// <param name="stubDomGenerator">
        /// An instance of type <see cref="IStubDomGenerator" />.
        /// </param>
        public StubAssemblyGenerator(
            IAssemblyWrapperFactory assemblyWrapperFactory,
            ICSharpCompilationWrapperFactory cSharpCompilationWrapperFactory,
            IAppDomainWrapper environmentTrustedAssembliesProvider,
            IFileInfoWrapperFactory fileInfoWrapperFactory,
            ILoggingProvider loggingProvider,
            IMetadataReferenceWrapperFactory metadataReferenceWrapperFactory,
            IStubAssemblyGeneratorSettingsProvider stubAssemblyGeneratorSettingsProvider,
            IStubDomGenerator stubDomGenerator)
        {
            this.assemblyWrapperFactory = assemblyWrapperFactory;
            this.cSharpCompilationWrapperFactory =
                cSharpCompilationWrapperFactory;
            this.environmentTrustedAssembliesProvider =
                environmentTrustedAssembliesProvider;
            this.fileInfoWrapperFactory = fileInfoWrapperFactory;
            this.loggingProvider = loggingProvider;
            this.metadataReferenceWrapperFactory =
                metadataReferenceWrapperFactory;
            this.stubAssemblyGeneratorSettingsProvider =
                stubAssemblyGeneratorSettingsProvider;
            this.stubDomGenerator = stubDomGenerator;
        }

        /// <summary>
        /// Implements
        /// <see cref="IStubAssemblyGenerator.Create{TDatabaseContractType}(IFileInfoWrapper, IEnumerable{ContractMethodInformation})" />.
        /// </summary>
        /// <typeparam name="TDatabaseContractType">
        /// The database contract interface type.
        /// </typeparam>
        /// <param name="destinationLocation">
        /// The destination location for the new stub
        /// <see cref="IAssemblyWrapper" />.
        /// </param>
        /// <param name="contractMethodInformations">
        /// An array of <see cref="ContractMethodInformation" /> instances.
        /// </param>
        /// <returns>
        /// An instance of type <see cref="IAssemblyWrapper" />.
        /// </returns>
        public IAssemblyWrapper Create<TDatabaseContractType>(
            IFileInfoWrapper destinationLocation,
            IEnumerable<ContractMethodInformation> contractMethodInformations)
            where TDatabaseContractType : class
        {
            IAssemblyWrapper toReturn = null;

            Type databaseContractType = typeof(TDatabaseContractType);

            CodeCompileUnit codeCompileUnit = new CodeCompileUnit();

            this.loggingProvider.Debug(
                $"Generating {nameof(CodeNamespace)} for entire stub " +
                $"assembly...");

            // 1) Generate the entire namespace and...
            CodeNamespace codeNamespace =
                this.stubDomGenerator.GenerateEntireStubAssemblyDom(
                    databaseContractType,
                    contractMethodInformations);

            this.loggingProvider.Info(
                $"{nameof(CodeNamespace)} generation complete.");

            // ... add it to the CodeCompileUnit.
            codeCompileUnit.Namespaces.Add(codeNamespace);

            this.loggingProvider.Debug(
                "Generating source code for new stub assembly...");

            // 2) Generate the source...
            string generatedAssemblyCode =
                this.GenerateAssemblyCode(codeCompileUnit);

            int loc = generatedAssemblyCode
                .Split(new string[] { Environment.NewLine }, StringSplitOptions.None)
                .Count();

            this.loggingProvider.Info(
                $"Source code generated and held in memory ({loc} lines of " +
                $"code, including comments and empty lines).");

            // 2a) Then, depending on the settings, output it to a code file.
            if (this.stubAssemblyGeneratorSettingsProvider.GenerateAssemblyCodeFile)
            {
                this.loggingProvider.Debug(
                    $"{nameof(IStubAssemblyGeneratorSettingsProvider.GenerateAssemblyCodeFile)} " +
                    $"= {true.ToString(CultureInfo.InvariantCulture)}. " +
                    $"Saving .cs code to file prior to compilation...");

                IFileInfoWrapper codeFileLocation = this.fileInfoWrapperFactory.Create(
                    $"{destinationLocation.FullName}.cs");
                using (Stream fileStream = codeFileLocation.Create())
                {
                    using (StreamWriter streamWriter = new StreamWriter(fileStream))
                    {
                        streamWriter.Write(generatedAssemblyCode);
                    }
                }

                this.loggingProvider.Info($".cs file generated.");
            }

            IAssemblyWrapper hostAssembly = this.assemblyWrapperFactory
                .Create(databaseContractType.Assembly);

            // 3) Compile it.
            this.loggingProvider.Debug(
                $"Compiling {nameof(CodeNamespace)} to " +
                $"\"{destinationLocation.FullName}\"...");

            toReturn = this.CompileStubAssemblySource(
                destinationLocation,
                hostAssembly,
                generatedAssemblyCode);

            this.loggingProvider.Info(
                $"\"{toReturn.FullName}\" generated. Returning.");

            return toReturn;
        }

        private IAssemblyWrapper CompileStubAssemblySource(
            IFileInfoWrapper destinationLocation,
            IAssemblyWrapper hostAssembly,
            string assemblySource)
        {
            IAssemblyWrapper toReturn = null;

            this.loggingProvider.Debug(
                $"Parsing the {nameof(assemblySource)} into a " +
                $"{nameof(SyntaxTree)} instance...");

            SyntaxTree syntaxTree = CSharpSyntaxTree.ParseText(assemblySource);

            this.loggingProvider.Info(
                $"{nameof(SyntaxTree)} instance generated.");

            IEnumerable<IMetadataReferenceWrapper> metadataReferenceWrappers =
                this.PrepareReferencesToDependenciesForStubAssembly(
                    hostAssembly);

            ICSharpCompilationWrapper compilation =
                this.cSharpCompilationWrapperFactory.Create(
                    destinationLocation,
                    syntaxTree,
                    metadataReferenceWrappers);

            this.loggingProvider.Debug(
                "Compilation fully prepared. About to perform compilation " +
                "of assembly source...");

            using (MemoryStream ms = new MemoryStream())
            {
                IEmitResultWrapper result = compilation.Emit(ms);

                if (result.Success)
                {
                    this.loggingProvider.Info(
                        $"Compilation was successful.");

                    // Rewind the stream and...
                    ms.Seek(0, SeekOrigin.Begin);

                    this.loggingProvider.Debug(
                        $"Writing generated assembly to " +
                        $"{destinationLocation.FullName}...");

                    // Save it to file.
                    using (Stream fileStream = destinationLocation.Create())
                    {
                        ms.WriteTo(fileStream);
                    }

                    this.loggingProvider.Info(
                        $"Generated assembly written to " +
                        $"{destinationLocation.FullName}. Loading assembly " +
                        $"into memory...");

                    // Then load it.
                    toReturn = this.assemblyWrapperFactory
                        .LoadFile(destinationLocation.FullName);

                    this.loggingProvider.Info(
                        $"{toReturn.FullName} loaded into memory with " +
                        $"success.");
                }
                else
                {
                    this.loggingProvider.Fatal(
                        "Compilation failed. Gathering error information...");

                    IEnumerable<IDiagnosticWrapper> diagnostics = result.Diagnostics
                        .Where(x =>
                            x.IsWarningAsError || x.Severity == DiagnosticSeverity.Error);

                    this.loggingProvider.Fatal(
                        $"{diagnostics.Count()} {nameof(Diagnostic)} " +
                        $"instance(s) fetched. Throwing a " +
                        $"{nameof(StubCompilationException)} instance...");

                    throw new StubCompilationException(diagnostics);
                }
            }

            return toReturn;
        }

        private IEnumerable<IMetadataReferenceWrapper> PrepareReferencesToDependenciesForStubAssembly(
            IAssemblyWrapper hostAssembly)
        {
            IEnumerable<IMetadataReferenceWrapper> toReturn = null;

            this.loggingProvider.Debug(
                "Pulling back all assemblies in the current AppDomain...");

            IEnumerable<IAssemblyWrapper> trustedAssembliesPaths =
                this.environmentTrustedAssembliesProvider.GetAssemblies();

            this.loggingProvider.Info(
                $"{trustedAssembliesPaths.Count()} assemblies returned.");

            this.loggingProvider.Debug(
                $"Converting assemblies to " +
                $"{nameof(IMetadataReferenceWrapper)} instance(s)...");

            toReturn = trustedAssembliesPaths
                .Select(x => x.Location)
                .Select(x => this.metadataReferenceWrapperFactory.Create(x));

            this.loggingProvider.Info(
                $"{toReturn.Count()} {nameof(IMetadataReferenceWrapper)} " +
                $"instance(s) prepared.");

            return toReturn;
        }

        private string GenerateAssemblyCode(CodeCompileUnit codeCompileUnit)
        {
            string toReturn = null;

            byte[] codeBytes = null;
            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (StreamWriter streamWriter = new StreamWriter(memoryStream))
                {
                    CodeGeneratorOptions codeGeneratorOptions =
                        new CodeGeneratorOptions()
                        {
                            BracingStyle = "C",
                            BlankLinesBetweenMembers = true,
                        };

                    this.loggingProvider.Debug(
                        "Generating assembly code in memory...");

                    using (CSharpCodeProvider cSharpCodeProvider = new CSharpCodeProvider())
                    {
                        cSharpCodeProvider.GenerateCodeFromCompileUnit(
                            codeCompileUnit,
                            streamWriter,
                            codeGeneratorOptions);
                    }
                }

                // Extract the bytes, so that we can convert it to a string.
                codeBytes = memoryStream.ToArray();

                this.loggingProvider.Info(
                    $"Assembly code generated ({codeBytes.Length} byte(s)).");
            }

            toReturn = Encoding.UTF8.GetString(codeBytes);

            return toReturn;
        }
    }
}