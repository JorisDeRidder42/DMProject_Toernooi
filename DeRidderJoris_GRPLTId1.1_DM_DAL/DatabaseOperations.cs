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
        public static List<Toernooi> OphalenGekozenSpel()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.gameMode == Helper.buttonSpel)
                    .OrderBy(t => t.datum)
                    .ThenBy(t => t.checkInUur)
                     .ToList();
            }
        }
        //gegevens van deze wedstrijd word in de labels geplaatst
        public static Toernooi OphalenWedstrijdId()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiID == Helper.IdGame)
                    .SingleOrDefault();
                //select Toernooi.toernooi
                //where ToernooiID == Helper.IdGame
            }
        }
        //ophalen id van 1 game met alle ranks in combobox
        public static Toernooi OphalenToernooiMetRanks()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiID == Helper.IdGame)
                    .Include(t => t.ToernooiRanks.Select(sub => sub.Rank))
                    .SingleOrDefault();
                    //Select from Toernooi.toernooi
                    //where ToernooiID == IdGame
                    //ToernooiRanks JOIN ranknaam
            }
        }
        public static List<Prijs> OphalenPrijzen()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Prijs
                    .Where(p => p.prijsPot.ToString() == Helper.prijzen)
                    .ToList();
                    //select from toernooi.Prijs
                    //where prijsPot == prijzen
            }
        }
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
