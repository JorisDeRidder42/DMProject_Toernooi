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
    
    public partial class ToernooiPrijs
    {
        public int ToernooiprijsID { get; set; }
        public int PrijsID { get; set; }
        public int ToernooiID { get; set; }
    
        public virtual Prijs Prijs { get; set; }
        public virtual Toernooi Toernooi { get; set; }
    }
}