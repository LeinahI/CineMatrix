<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewfilms.aspx.cs" Inherits="FilmMS.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            background-color: #ff9a56;
            color: white;
        }

        .accent-clr {
            background-color: #d162a4;
            color: white;
        }
    </style>
    <script>
        //admndirmgmt table start
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": true,
                pageLength: 0,
                lengthMenu: [
                    [3, 7, -1],
                    [3, 7, "All"]
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid mb-5 px-5">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h3>Film Inventory List
                    </h3>
                </center>
            </div>
        </div>

        <div class="row">
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <asp:SqlDataSource ID="admnflminvt_SqlDataSource" runat="server"
                            ConnectionString="<%$ ConnectionStrings:efilmlibDBConnectionString %>"
                            SelectCommand="SELECT * FROM [film_master_tbl]" />
                        <div class="col">
                            <asp:GridView class="table table-stripped table-bordered" AutoGenerateColumns="False" ID="admnflminvt_GridView" runat="server" DataSourceID="admnflminvt_SqlDataSource">
                                <Columns>
                                    <asp:BoundField DataField="film_id" HeaderText="Film ID" InsertVisible="False" ReadOnly="True" SortExpression="film_id" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <%-- All details from database --%>
                                                    <div class="col-lg-10">

                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="admnflminvt_filmNamedb" runat="server" Text='<%# Eval("film_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                Director -
                                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("director_name") %>'></asp:Label>
                                                                &nbsp;| Genre -
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                &nbsp;| Language -
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                Studio -
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("production_company_name") %>'></asp:Label>
                                                                &nbsp;| Release date -
                                                                        <asp:Label ID="admnflminvt_reldatedb" runat="server" Font-Bold="True" Text='<%# Eval("release_date", "{0:MMMM/dd/yyyy}") %>'></asp:Label>
                                                                &nbsp;| length -
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("film_length_min") %>'></asp:Label>
                                                                min
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                Rent cost - ₱<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("film_cost","{0:0.00}") %>'></asp:Label>
                                                                &nbsp;| Actual stock -
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                &nbsp;| Available -
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                <br />
                                                                <span class="fw-bold">Description</span> -
                                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("film_description") %>'></asp:Label>

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <%-- Image link --%>
                                                    <div class="col-lg-2">
                                                        <center>
                                                            <asp:Image CssClass="img-thumbnail p-2" Height="300" Width="200" ID="admnflminvt_imglinkdb" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </center>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>

                        </div>

                    </div>

                </div>
            </div>

        </div>

    </div>
    <br />
    <br />
</asp:Content>
