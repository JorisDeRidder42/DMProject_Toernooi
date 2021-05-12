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
                    .Where(t => t.gamemode == Helper.buttonSpel)
                    .OrderBy(t => t.toernooiNaam)
                    .ThenBy(t => t.checkInuur)
                     .ToList();
            }
        }
        public static Toernooi OphalenWedstrijdId()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdGame)
                    .SingleOrDefault();
            }
        }
    }
}
