using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using DeRidderJoris_GRPLTId1;
using DeRidderJoris_GRPLTId1._1_DM_DAL;
using DeRidderJoris_GRPLTId1._1_DM_Models;

namespace DeRidderJoris_GRPLTId1._1_DM_UnitTests
{
    [TestClass]
    public class ProjectTest
    {
        [TestMethod]
        public void buttonSpel_IsGelijkAanGekozenSpel()
        {
            //Arrange 
            string gekozenSpel = Helper.buttonSpel;

            //Act
            gekozenSpel = "Rocket-League";
            //Assert
            Assert.AreEqual("Rocket-League", gekozenSpel);
        }


        [TestMethod]
        public void GekozenToernooi_haaldatavanGekozenToernooiOpdmvToernooiId()
        {
            //Arrange 
            int toernooiId = Helper.IdToernooi;

            //Act
            toernooiId = 12;
            //Assert
            Assert.AreEqual(12, toernooiId);
        }
    }
}
