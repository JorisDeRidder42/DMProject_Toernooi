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
                if (columnName == "toernooiNaam" && string.IsNullOrWhiteSpace(toernooiNaam))
                {
                    return "toernooiNaam is een verplicht veld!\n";
                }
                if (columnName == "datum" && datum == null)
                {
                    return "datum is een verplicht veld!\n";
                }
                if (columnName == "checkInuur" && checkInuur == null)
                {
                    return "checkInuur is een verplicht veld!\n";
                }
                return "";
            }
        }
        public override bool Equals(object obj)
        {
            return obj is Toernooi toernooi &&
                toernooiId == toernooi.toernooiId &&
                toernooiNaam == toernooi.toernooiNaam;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
