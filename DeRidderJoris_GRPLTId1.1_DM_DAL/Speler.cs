//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Speler
    {
        public int spelerId { get; set; }
        public string voornaam { get; set; }
        public string achternaam { get; set; }
        public string nicknaam { get; set; }
        public string wachtwoord { get; set; }
        public string email { get; set; }
        public System.DateTime geboortedatum { get; set; }
        public string geboorteplaats { get; set; }
    
        public virtual Prijs Prijs { get; set; }
    }
}
