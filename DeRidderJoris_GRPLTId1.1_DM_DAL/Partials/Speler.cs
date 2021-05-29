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
                    return "Voornaam is een verplicht veld!\n";
                }
                if (columnName == "achternaam" && string.IsNullOrWhiteSpace(achternaam))
                {
                    return "Achternaam is een verplicht veld!\n";
                }
                if (columnName == "nicknaam" && string.IsNullOrWhiteSpace(nicknaam))
                {
                    return "Nicknaam is een verplicht veld!\n";
                }
                if (columnName == "wachtwoord" && string.IsNullOrWhiteSpace(wachtwoord))
                {
                    return "Wachtwoord is een verplicht veld!\n";
                }
                if (columnName == "email" && string.IsNullOrWhiteSpace(email))
                {
                    return "Email is een verplicht veld!\n";
                }
                if (columnName == "geboortedatum" && geboortedatum > DateTime.Now)
                {
                    return "Gelieve een andere datum te selecteren!\n";
                }
                if (columnName == "geboorteplaats" && string.IsNullOrWhiteSpace(geboorteplaats))
                {
                    return "Geboorteplaats is een verplicht veld!\n";
                }
                return "";
            }
        }
        public override bool Equals(object obj)
        {
            return obj is Speler speler &&
                voornaam == speler.voornaam &&
                achternaam == speler.achternaam &&
                nicknaam == speler.nicknaam;
        }
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
