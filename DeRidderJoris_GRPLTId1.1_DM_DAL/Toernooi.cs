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
    
    public partial class Toernooi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Toernooi()
        {
            this.Prijs = new HashSet<Prijs>();
        }
    
        public int toernooiId { get; set; }
        public string toernooiNaam { get; set; }
        public string plaats { get; set; }
        public Nullable<int> prijzenpot { get; set; }
        public System.DateTime startdatum { get; set; }
        public Nullable<System.DateTime> einddatum { get; set; }
        public System.TimeSpan CheckInuur { get; set; }
        public System.TimeSpan Startuur { get; set; }
        public string Gamemode { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Prijs> Prijs { get; set; }
    }
}
