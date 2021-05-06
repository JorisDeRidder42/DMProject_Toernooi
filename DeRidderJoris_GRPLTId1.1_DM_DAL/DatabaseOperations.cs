using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                    .Where(t => t.Gamemode == ButtonHelper.buttonSpel)
                    .OrderBy(t => t.toernooiNaam)
                    .ThenBy(t => t.CheckInuur)
                     .ToList();
            }
        }
    }
}
