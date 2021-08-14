using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using DeRidderJoris_GRPLTId1;
using DeRidderJoris_GRPLTId1._1_DM_DAL;

namespace DeRidderJoris_GRPLTId1._1_DM_UnitTests
{
    [TestClass]
    public class ProjectTest
    {

        //controle of gamemode 1 == rocket league
        [TestMethod]
        public void ControllerenofdeInformatiekloptVanGameMode()
        {
            {
                //Arrange
                GameMode gameMode = new GameMode();

                //Act
                gameMode.gameModeNaam = "Rocket league";
                gameMode.gameModeId = 1;

                //Assert
                Assert.AreEqual("Rocket league", gameMode.gameModeNaam);
                Assert.AreEqual(1, gameMode.gameModeId);
            }

        }

        //controle of gamemode 1 == unranked
        [TestMethod]
        public void ControllerenofdeInformatieKloptVanRank()
        { 
            {
                //Arrange
                Rank rank = new Rank();

                //Act
                rank.rankId = 1;
                rank.rankNaam = "Unranked";

                //Assert
                Assert.AreEqual("Unranked", rank.rankNaam);
                Assert.AreEqual(1, rank.rankId);
            }
        }
    }
}
