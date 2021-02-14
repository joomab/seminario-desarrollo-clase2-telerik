using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using Telerik.Web.UI;
public partial class MantenimientoLibro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private dbExamen2Entities2 _dataContext;

    protected dbExamen2Entities2 DbContext
    {
        get
        {
            if (_dataContext == null)
            {
                _dataContext = new dbExamen2Entities2();
            }
            return _dataContext;
        }
    }

    public override void Dispose()
    {
        if (_dataContext != null)
        {
            _dataContext.Dispose();
        }
        base.Dispose();
    }

    protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
        var result = from r in DbContext.libroes
                     select r;

        RadGrid1.DataSource = result.ToList();
    }

    protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
    {
        var editableItem = ((GridEditableItem)e.Item);
        var libroId = (int)editableItem.GetDataKeyValue("IdLibro");

        //retrive entity form the Db
        var product = DbContext.libroes.Where(n => n.IdLibro == libroId).FirstOrDefault();
        if (product != null)
        {
            //update entity's state
            editableItem.UpdateValues(product);

            try
            {
                //save chanages to Db
                DbContext.SaveChanges();
            }
            catch (System.Exception)
            {
                ShowErrorMessage();
            }
        }
    }

    /// <summary>
    /// Shows a <see cref="RadWindow"/> alert if an error occurs
    /// </summary>
    private void ShowErrorMessage()
    {
        RadAjaxManager1.ResponseScripts.Add(string.Format("window.radalert(\"Please enter valid data!\")"));
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && (e.Item.IsInEditMode))
        {
            GridEditableItem editableItem = (GridEditableItem)e.Item;
            SetupInputManager(editableItem);
        }
    }

    private void SetupInputManager(GridEditableItem editableItem)
    {
        // style and set ProductName column's textbox as required
        var textBox =
            ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("Titulo")).TextBoxControl;

    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        var editableItem = ((GridEditableItem)e.Item);
        //create new entity
        var libro = new libro();
        //populate its properties
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);
        libro.Titulo = (string)values["Titulo"];
        if (values["AnioEdicion"] != null)
        {
            libro.AnioEdicion = short.Parse(values["AnioEdicion"].ToString());
        }

        if (values["Estado"] != null)
        {
            libro.Estado = Boolean.Parse(values["Estado"].ToString());
        }


        DbContext.libroes.Add(libro);
        try
        {
            //save chanages to Db
            DbContext.SaveChanges();
        }
        catch (System.Exception)
        {
            ShowErrorMessage();
        }
    }

    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {
        var libroId = (int)((GridDataItem)e.Item).GetDataKeyValue("IdLibro");

        //retrive entity form the Db
        var libro = DbContext.libroes.Where(n => n.IdLibro == libroId).FirstOrDefault();
        if (libro != null)
        {
            //add the product for deletion
            DbContext.libroes.Remove(libro);
            try
            {
                //save chanages to Db
                DbContext.SaveChanges();
            }
            catch (System.Exception)
            {
                ShowErrorMessage();
            }
        }
    }
}
