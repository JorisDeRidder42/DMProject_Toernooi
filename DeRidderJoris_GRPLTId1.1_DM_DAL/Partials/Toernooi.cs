using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DeRidderJoris_GRPLTId1._1_DM_Models;

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    public partial class Toernooi : BasisKlasse
    {
        public override string this[string columnName]
        {
            get
            {
                if (columnName == "toernooiId" && toernooiId <= 0)
                {
                    return "toernooiId is een verplicht veld!";
                }
                if (columnName == "toernooiNaam" && string.IsNullOrWhiteSpace(toernooiNaam))
                {
                    return "toernooiNaam is een verplicht veld!";
                }
                if (columnName == "datum" && datum != null)
                {
                    return "datum is een verplicht veld!";
                }
                if (columnName == "checkInuur" && checkInuur != null)
                {
                    return "checkInuur is een verplicht veld!";
                }
                return "";
            }
        }
    }
}
