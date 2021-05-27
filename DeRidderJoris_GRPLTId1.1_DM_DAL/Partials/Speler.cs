using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DeRidderJoris_GRPLTId1._1_DM_Models;

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    public partial class Speler : BasisKlasse
    {
        public override string this[string columnName]
        {
            get
            {
                if (columnName == "voornaam" && string.IsNullOrWhiteSpace(voornaam))
                {
                    return "voornaam is een verplicht veld!";
                }
                if (columnName == "achternaam" && string.IsNullOrWhiteSpace(achternaam))
                {
                    return "achternaam is een verplicht veld!";
                }
                if (columnName == "nicknaam" && string.IsNullOrWhiteSpace(nicknaam))
                {
                    return "nicknaam is een verplicht veld!";
                }
                if (columnName == "wachtwoord" && string.IsNullOrWhiteSpace(wachtwoord))
                {
                    return "wachtwoord is een verplicht veld!";
                }
                if (columnName == "email" && string.IsNullOrWhiteSpace(email))
                {
                    return "email is een verplicht veld!";
                }
                if (columnName == "geboorteplaats" && string.IsNullOrWhiteSpace(geboorteplaats))
                {
                    return "geboorteplaats is een verplicht veld!";
                }
                return "";
            }
        }
    }
}
