
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace ILoveShawa.Domain
{

using System;
    using System.Collections.Generic;
    
public partial class Review
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Review()
    {

        this.Likes = new HashSet<Like>();

    }


    public int Id { get; set; }

    public string Text { get; set; }

    public bool Positive { get; set; }

    public int UserId { get; set; }

    public int ShopId { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Like> Likes { get; set; }

    public virtual ShawaShop ShawaShop { get; set; }

    public virtual User User { get; set; }

}

}
