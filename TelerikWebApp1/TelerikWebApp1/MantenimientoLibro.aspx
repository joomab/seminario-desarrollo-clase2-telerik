<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MantenimientoLibro.aspx.cs" Inherits="MantenimientoLibro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function rowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    <telerik:AjaxUpdatedControl ControlID="RadInputManager1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" />
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
    <div id="demo" class="demo-container no-bg">
        <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid1" AutoGenerateColumns="False" AllowPaging="True"
            OnNeedDataSource="RadGrid1_NeedDataSource" OnUpdateCommand="RadGrid1_UpdateCommand"
            OnItemCreated="RadGrid1_ItemCreated" OnDeleteCommand="RadGrid1_DeleteCommand"
            OnInsertCommand="RadGrid1_InsertCommand" CellSpacing="-1" GridLines="Both">
            <MasterTableView DataKeyNames="IdLibro" CommandItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                <Columns>
                    <telerik:GridEditCommandColumn />
                    <telerik:GridBoundColumn DataField="IdLibro" HeaderText="Libro ID" ReadOnly="true"
                        ForceExtractValue="Always" ConvertEmptyStringToNull="true" />
                    <telerik:GridBoundColumn DataField="Titulo" HeaderText="Titulo" />
                    <telerik:GridCheckBoxColumn DataField="Estado" DataType="System.Boolean" FilterControlAltText="Filter Estado column" HeaderText="Estado" UniqueName="Estado">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="AnioEdicion" HeaderText="Año Edicion" />
                    <telerik:GridButtonColumn ConfirmText="Delete this libro?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete" ButtonType="FontIconButton" CommandName="Delete" />
                </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
            <PagerStyle Mode="NextPrevAndNumeric" />
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <ClientSettings>
                <ClientEvents OnRowDblClick="rowDblClick" />
            </ClientSettings>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>
    </div>
    <telerik:RadInputManager RenderMode="Lightweight" runat="server" ID="RadInputManager1" Enabled="true">
        <telerik:TextBoxSetting BehaviorID="TextBoxSetting1">
        </telerik:TextBoxSetting>
        <telerik:NumericTextBoxSetting BehaviorID="NumericTextBoxSetting1" Type="Currency"
            AllowRounding="true" DecimalDigits="2">
        </telerik:NumericTextBoxSetting>
        <telerik:NumericTextBoxSetting BehaviorID="NumericTextBoxSetting2" Type="Number"
            AllowRounding="true" DecimalDigits="0" MinValue="0">
        </telerik:NumericTextBoxSetting>
    </telerik:RadInputManager>
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>
