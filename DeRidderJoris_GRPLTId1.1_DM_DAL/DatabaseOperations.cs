using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    public static class DatabaseOperations
    {
        // filteren van de database op gamemode enkel de toernooien van gekozen spel worden getoond
        public static List<GameMode> OphalenGekozenSpel()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.GameMode
                    .Where(t => t.gameModeNaam == Helper.buttonSpel)
                     .ToList();
            }
        }
        //gegevens van deze wedstrijd word in de labels geplaatst
        public static Toernooi OphalenWedstrijdId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdGame)
                    .SingleOrDefault();
            }
        }


        //public static GameMode OphalenImageMetId()
        //{
        //    using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
        //    {
        //        return toernooiEntities.GameMode
        //            .Where(t => t.gameModeNaam == Helper.IdGame)
        //            .SingleOrDefault();
        //    }
        //}
        //ophalen id van 1 game met alle ranks in combobox
        //public static List<Rank> OphalenToernooiMetRanks()
        //{
        //    using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
        //    {
        //        return toernooiEntities.GameMode
        //            .Where(t => t.gameModeId == Helper.IdSpel)
        //            .Include(t => t.GameModeRank.Select(sub => sub.Rank.rankNaam))
        //            .ToList();
        //            //Select from Toernooi.toernooiRank
        //            //where ToernooiID == IdSpel
        //    }
        //}
        //public static List<Prijs> OphalenPrijzen()
        //{
        //    using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
        //    {
        //          return toernooiEntities.Prijs
        //          .Where(p => p.prijsPot.ToString() == Helper.prijzen)
        //          .ToList();
        //            //select from toernooi.Prijs
        //            //where prijsPot == prijzen
        //    }
        //}
        //public static int VerwijderenToernooi(Toernooi toernooi)
        //{
        //    try
        //    {
        //        using (ToernooiDBEntities toernooiDBEntities = new ToernooiDBEntities())
        //        {

        //            toernooiDBEntities.Entry(toernooi).State = EntityState.Deleted;
        //            return toernooi.SaveChanges();

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        FileOperations.FoutLoggen(ex);
        //        return 0;
        //    }
        //}
    }
}
