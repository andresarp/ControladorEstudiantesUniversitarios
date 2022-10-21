<%@ Page Title="Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Curso.aspx.cs" Inherits="Curso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1>Control de cursos</h1>
    
    <table class="nav-justified" style="width: 107%; height: 548px; margin-right: 91px">
        <tr>
            <td class="modal-sm" style="width: 486px; height: 20px;"></td>
            <td class="modal-sm" style="width: 290px; height: 20px;"></td>
            <td style="width: 315px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td style="width: 315px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 36px;">
                <asp:Label ID="lblId" runat="server" Text="Identificación"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 290px; height: 36px;">
                <asp:TextBox ID="tboxID" runat="server" Width="200px" Enabled="False"></asp:TextBox>
            </td>
            <td rowspan="7" style="width: 315px">
                <asp:GridView ID="dgViewCourses" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="373px" Width="883px" OnSelectedIndexChanged="dgViewCourses_SelectedIndexChanged" style="margin-left: 35px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="schoolName" HeaderText="Nombre de la escuela" SortExpression="Nombre de la escuela" />
                        <asp:BoundField DataField="courseName" HeaderText="Nombre del curso" SortExpression="Nombre del curso" />
                        <asp:BoundField DataField="description" HeaderText="Descripción" SortExpression="Descripción" />
                        <asp:BoundField DataField="price" HeaderText="Precio" SortExpression="Precio" />
                        <asp:BoundField DataField="career" HeaderText="Carrera" SortExpression="Carrera" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Courses] WHERE [Id] = @original_Id AND [schoolName] = @original_schoolName AND [courseName] = @original_courseName AND [description] = @original_description AND [price] = @original_price AND (([career] = @original_career) OR ([career] IS NULL AND @original_career IS NULL))" InsertCommand="INSERT INTO [Courses] ([schoolName], [courseName], [description], [price], [career]) VALUES (@schoolName, @courseName, @description, @price, @career)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [schoolName], [courseName], [description], [price], [career] FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [schoolName] = @schoolName, [courseName] = @courseName, [description] = @description, [price] = @price, [career] = @career WHERE [Id] = @original_Id AND [schoolName] = @original_schoolName AND [courseName] = @original_courseName AND [description] = @original_description AND [price] = @original_price AND (([career] = @original_career) OR ([career] IS NULL AND @original_career IS NULL))" OnSelecting="SqlDataSource1_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_schoolName" Type="String" />
                        <asp:Parameter Name="original_courseName" Type="String" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_price" Type="Decimal" />
                        <asp:Parameter Name="original_career" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="schoolName" Type="String" />
                        <asp:Parameter Name="courseName" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="career" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="schoolName" Type="String" />
                        <asp:Parameter Name="courseName" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="career" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_schoolName" Type="String" />
                        <asp:Parameter Name="original_courseName" Type="String" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_price" Type="Decimal" />
                        <asp:Parameter Name="original_career" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 36px;">
                <asp:Label ID="lblSchoolName" runat="server" Text="Nombre de la escuela"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 290px; height: 36px;">
                <asp:TextBox ID="tboxSchoolName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td style="height: 38px; width: 486px">
                <asp:Label ID="lblcourseName" runat="server" Text="Nombre del curso"></asp:Label>
            </td>
            <td style="height: 38px; width: 290px">
                <asp:TextBox ID="tboxCourseName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 38px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 97px;">
                <asp:Label ID="labelSecondName" runat="server" Text="Descripción"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 290px; height: 97px;">
                <textarea id="tAreaDescription" name="S1" style="width: 200px; height: 62px" accesskey="tAreaDescription"></textarea></td>
            <td style="height: 97px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 41px;">
                <asp:Label ID="lblCost" runat="server" Text="Costo"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 290px; height: 41px;">
                <asp:TextBox ID="tboxCost" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 41px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 44px">
                <asp:Label ID="lblCareer" runat="server" Text="Carrera"></asp:Label>
            </td>
            <td style="height: 44px; width: 290px">
                <asp:DropDownList AppendDataBoundItems="true" ID="DropDownListCareer" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Id" Height="42px" Width="200px">
                <asp:ListItem Value="-1">Seleccione una opción</asp:ListItem>
               </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Nombre], [Id] FROM [Career]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Career] WHERE [Id] = @original_Id AND [Nombre] = @original_Nombre" InsertCommand="INSERT INTO [Career] ([Nombre]) VALUES (@Nombre)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Career] SET [Nombre] = @Nombre WHERE [Id] = @original_Id AND [Nombre] = @original_Nombre">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="height: 44px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 78px;"></td>
            <td class="modal-sm" style="width: 290px; height: 78px;">
                <asp:Button ID="btnUpdate" runat="server" OnClick="Button2_Click" Text="Actualizar" />
                <asp:Button ID="btnDelete" runat="server" BackColor="#CC0000" ForeColor="White" Text="Eliminar" OnClick="btnDelete_Click" />
                <asp:Button ID="btnClean" runat="server" BackColor="#66CCFF" ForeColor="Black" OnClick="btnClean_Click" Text="Limpiar" Width="75px" />
                <asp:Button ID="btnAdd" runat="server" BackColor="#339933" ForeColor="White" Text="Agregar" OnClick="btnAdd_Click" Width="225px" Height="31px" />
            </td>
            <td style="height: 78px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 20px"></td>
            <td style="height: 20px; width: 290px">
                </td>
            <td style="height: 20px; width: 315px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 42px;"></td>
            <td class="modal-sm" style="width: 290px; height: 42px;"></td>
            <td style="width: 315px; height: 42px;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
            <td style="height: 42px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 486px; height: 49px;"></td>
            <td class="modal-sm" style="width: 290px; height: 49px;"></td>
            <td style="width: 315px; height: 49px;"></td>
            <td style="height: 49px"></td>
        </tr>
    </table>


</asp:Content>
