<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admnmembermgmt.aspx.cs" Inherits="FilmMS.admnmembermgmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //admndirmgmt table start
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": true,
                pageLength: 0,
                lengthMenu: [
                    [10, -1],
                    [10, "All"]
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
    <div class="container-fluid mb-5 mt-5">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Details</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="admnmmgmt_memidtbx" placeholder="Member ID" runat="server"></asp:TextBox>
                                        <label for="memidtbx">Member ID</label>
                                        <asp:LinkButton class="btn btn-primary d-flex align-items-center" ID="admnmmgmt_searchbtn" runat="server" OnClick="admnmmgmt_searchbtn_Click">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_fntbx" placeholder="Full Name" required="required" runat="server"></asp:TextBox>
                                    <label for="fntbx">Full Name</label>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="admnmmgmt_accstattbx" placeholder="Accstat" required="required" runat="server" ReadOnly="True"></asp:TextBox>
                                        <label for="accstattbx">Account Status</label>

                                        <asp:LinkButton class="btn btn-success d-flex align-items-center" ID="admnmmgmt_btnActive" required="required" runat="server" Text="A" OnClick="admnmmgmt_btnActive_Click">
                                            <i class="fa-solid fa-circle-check"></i>
                                        </asp:LinkButton>


                                        <asp:LinkButton class="btn btn-info d-flex align-items-center" ID="admnmmgmt_btnPending" required="required" runat="server" Text="P" OnClick="admnmmgmt_btnPending_Click">
                                            <i class="fa-solid fa-circle-pause" style="color:#fff;"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton class="btn btn-danger d-flex align-items-center" ID="admnmmgmt_btnDeactivated" required="required" runat="server" Text="D" OnClick="admnmmgmt_btnDeactivated_Click">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">

                            <div class="col-md-3">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_dob" placeholder="dob" required="required" runat="server" TextMode="Date"> </asp:TextBox>
                                    <label for="memnametbx">Date of Birth</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_contactnumtbx" placeholder="Contact" required="required" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="admnmmgmt_contactnum">Contact No.</label>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_emailaddrtbx" placeholder="email ad" required="required" runat="server" TextMode="Email"></asp:TextBox>
                                    <label for="booknametbx">Email Address</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_regiontbx" placeholder="dob" required="required" runat="server"></asp:TextBox>
                                    <label for="memnametbx">Region</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_provincetbx" placeholder="Member ID" required="required" runat="server"></asp:TextBox>
                                    <label for="memnametbx">Province</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_citytbx" placeholder="email ad" required="required" runat="server"></asp:TextBox>
                                    <label for="booknametbx">Cities/Muncipalities</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_fulladdrtbx" placeholder="fulladdr" required="required" runat="server"></asp:TextBox>
                                    <label for="memctnumtbx">Full Address</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <center>
                                    <span class="badge text-bg-info text-white text-uppercase">Log in Credentials</span>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_unametbx" placeholder="uname" required="required" runat="server"></asp:TextBox>
                                    <label for="unametbx">Username</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnmmgmt_passtbx" required="required" runat="server"></asp:TextBox>
                                    <label for="mememailtbx">Password</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">
                            <div class=" btn-group">
                                <asp:Button CssClass="btn primary-clr text-light btn-lg" ID="admnmmgmt_update" runat="server" Text="Update User Data" OnClick="admnmmgmt_update_Click" />
                                <asp:Button CssClass="btn secondary-clr btn-block btn-lg" ID="admnmmgmt_delete" runat="server" Text="Delete User Data" OnClick="admnmmgmt_delete_Click" />
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="col ">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Member List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="admnmmgmt_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:efilmlibDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" ID="admnmmgmt_GridView" runat="server" DataSourceID="admnmmgmt_SqlDataSource" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" />
                                            <asp:BoundField DataField="full_name" HeaderText="Full Name" />
                                            <asp:BoundField DataField="account_status" HeaderText="Account Status" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact No." />
                                            <asp:BoundField DataField="email" HeaderText="Email" />
                                            <asp:BoundField DataField="region" HeaderText="Region" />
                                            <asp:BoundField DataField="province" HeaderText="Province" />
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
