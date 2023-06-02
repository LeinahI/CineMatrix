<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admnprodcommgmt.aspx.cs" Inherits="FilmMS.admnpubmgmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //admndirmgmt table start
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": true,
                pageLength: 0,
                lengthMenu: [
                    [5, 7, -1],
                    [5, 7, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records"
                },
                "targets": 'no-sort',
                "bSort": false,

            });
        });
        //admndirmgmt table end
    </script>
    <style>
        .primary-clr {
            background-color: #a30262;
            color: white;
        }

            .primary-clr:hover {
                background-color: #B55690;
                color: white;
            }

        .secondary-clr {
            background-color: #FF9A56;
            color: white;
        }

            .secondary-clr:hover {
                background-color: #EF7627;
                color: white;
            }

        .accent-clr {
            background-color: #D162A4;
            color: white;
        }

            .accent-clr:hover {
                background-color: #B55690;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container mb-5 mt-5">
        <div class="row">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Production Company Details</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/imgs/publisher.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="prodcom_idtbx" placeholder="Publisher ID" runat="server"></asp:TextBox>
                                        <label for="memfnametbx">Prod Co. ID</label>
                                        <asp:LinkButton class="btn btn-primary d-flex align-items-center" ID="prodcom_searchbtn" OnClick="prodcom_searchbtn_Click" runat="server">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="prodcom_nametbx" placeholder="an" runat="server"></asp:TextBox>
                                    <label for="memdobtbx">Production Co. Name</label>
                                </div>
                            </div>
                        </div>


                        <div class="row mt-4">

                            <div class=" btn-group">

                                <asp:Button ID="prodcom_add" class="btn btn-lg btn-block primary-clr" runat="server" Text="Add" OnClick="prodcom_add_Click" />
                                <asp:Button ID="prodcom_update" class="btn btn-lg btn-block text-light accent-clr" runat="server" Text="Update" OnClick="prodcom_update_Click"/>
                                <asp:Button ID="prodcom_delete" class="btn btn-lg btn-block secondary-clr" runat="server" Text="Delete" OnClick="prodcom_delete_Click" />

                            </div>

                        </div>


                        <div class="form-group mt-4">
                            <center>
                                <a href="userlogin.aspx" class="link-dark text-decoration-none text-secondary fw-bold">Go back</a>
                            </center>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="col ">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Production Company List</h4>

                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="admnprodcom_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:efilmlibDBConnectionString %>" SelectCommand="SELECT * FROM [production_company_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" ID="admnprodcom_GridView"
                                        runat="server" AutoGenerateColumns="False" DataSourceID="admnprodcom_SqlDataSource">
                                        <Columns>
                                            <asp:BoundField DataField="prod_com_id" HeaderText="Prod Co. ID" InsertVisible="False" ReadOnly="True" SortExpression="prod_com_id" />
                                            <asp:BoundField DataField="prod_com_name" HeaderText="Prod Co. Name" SortExpression="prod_com_name" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <br />
    <br />
</asp:Content>
