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
        // filteren van de database op gamemode enkel de toernooien van Fortnite worden getoond

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
        public static Toernooi OphalenWedstrijdId()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiID == Helper.IdGame)
                    .SingleOrDefault();
            }
        }
        public static List<Rank> OphalenRanksPerId()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                var query = toernooiEntities.ToernooiRank
                     .Where(t => t.ToernooiID == Helper.IdGame)
                    .Include(r => r.Rank);
                   var query2 = query
                    .Select(r => r.Rank)
                    .ToList();
                return query2;
            }
        }
    }
}
