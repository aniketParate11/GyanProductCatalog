/*Trigger to update Discount in Order Level based on the related Sales Agreement
 * Developer Name: Indrajit Mitra
 * Created On: 28/01/2021
 */

trigger GYNT_updateDiscounts on OrderItem (before insert,before update) {
    
    if(Trigger.Isbefore)
    {
        if(Trigger.Isinsert)
        {
            GYNC_updateDiscountsHandler.discountUpdate(Trigger.New);
        }
    }
    
}