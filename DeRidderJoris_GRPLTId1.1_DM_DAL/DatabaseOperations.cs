using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    public static class DatabaseOperations
    {
        public static List<Toernooi> OphalenToernooien()
        {
            using (ToernooiDBEntities toernooiEntities = new ToernooiDBEntities())
            {
               return toernooiEntities.Toernooi
                    
                    .ToList();
            }
        }
    }
}
