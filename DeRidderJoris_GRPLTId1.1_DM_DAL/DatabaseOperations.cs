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
            }
        }
        //ophalen id van 1 game met alle ranks in combobox (werkt niet)
        //public static List<Toernooi> OphalenRanksPerId()
        //{
        //    using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
        //    {
        //        return toernooiEntities.Toernooi
        //            .Where(t => t.toernooiID == Helper.IdGame)
        //            .Include(t =>t.ToernooiRanks.Select(sub => sub.Rank.ranknaam))
        //            .ToList();
        //    }
        //}
    }
}
