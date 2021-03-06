﻿namespace Meridian.InterSproc.Tests
{
    using Meridian.InterSproc.Definitions;
    using Meridian.InterSproc.Models;
    using Meridian.InterSproc.Tests.Infrastructure;
    using Meridian.InterSproc.Tests.Infrastructure.ExampleContracts;
    using Microsoft.VisualStudio.TestTools.UnitTesting;
    using Moq;
    using System;
    using System.CodeDom;
    using System.Collections.Generic;

    [TestClass]
    public class StubDomGeneratorTests
    {
        [TestMethod]
        public void GenerateEntireStubAssemblyDom_GeneratesDom_RequiredNumberOfNamespacesExistOnDom()
        {
            // Arrange
            const string Schema = "dbo";

            IStubDomGenerator stubDomGenerator =
                this.GetStubDomGeneratorInstance(
                    mockStubClassGenerator =>
                    {
                        // Just return a new, empty CodeTypeDeclaration.
                        mockStubClassGenerator
                            .Setup(x => x.CreateClass(
                                It.IsAny<Type>(),
                                It.IsAny<IEnumerable<ContractMethodInformation>>()))
                            .Returns(new CodeTypeDeclaration());
                    });

            Type databaseContractType = typeof(IVanillaContract);
            ContractMethodInformation[] contractMethodInformations =
            {
                new ContractMethodInformation()
                {
                    MethodInfo = typeof(IVanillaContract)
                        .GetMethod(nameof(IVanillaContract.FirstStoredProcedure)),
                    Name = nameof(IVanillaContract.FirstStoredProcedure),
                    Prefix = null,
                    Schema = Schema,
                },
                new ContractMethodInformation()
                {
                    MethodInfo = typeof(IVanillaContract)
                        .GetMethod(nameof(IVanillaContract.SecondStoredProcedure)),
                    Name = nameof(IVanillaContract.SecondStoredProcedure),
                    Prefix = null,
                    Schema = Schema,
                }
            };

            CodeNamespace result = null;

            int expectedNumberOfReferences = 5;
            int actualNumberOfReferences = default(int);

            // Act
            result = stubDomGenerator.GenerateEntireStubAssemblyDom(
                databaseContractType,
                contractMethodInformations);

            // Assert
            actualNumberOfReferences = result.Imports.Count;

            Assert.AreEqual(
                expectedNumberOfReferences,
                actualNumberOfReferences);
        }

        private IStubDomGenerator GetStubDomGeneratorInstance(
            Action<Mock<IStubClassGenerator>> setupMockStubClassGenerator)
        {
            IStubDomGenerator toReturn = null;

            ILoggingProvider loggingProvider = new LoggingProvider();
            Mock<IStubClassGenerator> mockStubClassGenerator =
                new Mock<IStubClassGenerator>();

            // Setup mocks
            setupMockStubClassGenerator(
                mockStubClassGenerator);

            toReturn = new StubDomGenerator(
                loggingProvider,
                mockStubClassGenerator.Object);

            return toReturn;
        }
    }
}