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
            this.ToernooiPrijzen = new HashSet<ToernooiPrijs>();
        }
    
        public int toernooiId { get; set; }
        public string toernooiNaam { get; set; }
        public System.DateTime datum { get; set; }
        public System.TimeSpan checkInuur { get; set; }
        public System.TimeSpan startuur { get; set; }
        public string gamemode { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ToernooiPrijs> ToernooiPrijzen { get; set; }
    }
}
