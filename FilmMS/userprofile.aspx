<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="FilmMS.userprofile" %>

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

        .vignette {
            position: relative;
        }

        .title {
            position: absolute;
            top: 35%;
            width: 100%;
            text-align: center;
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
    <div class="container-fluid mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 ">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="80px" src="images/imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Your Profile</h3>
                                    <span>Account status - </span>
                                    <asp:Label runat="server" CssClass="" ID="Label1" Text="Your status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_fnametbx" required="required" placeholder="un" runat="server"></asp:TextBox>
                                    <label for="memfnametbx">Full Name</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_dobtbx" required="required" placeholder="pw" runat="server" TextMode="Date"></asp:TextBox>
                                    <label for="memdobtbx">Date of Birth</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_ctnumtbx" required="required" placeholder="pw" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="memctnumtbx">Contact Number</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_emailtbx" required="required" placeholder="pw" runat="server" TextMode="Email"></asp:TextBox>
                                    <label for="mememailtbx">Email Address</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_region" required="required" placeholder="dob" runat="server"></asp:TextBox>
                                    <label for="memnametbx">Region</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_province" required="required" placeholder="Member ID" runat="server"></asp:TextBox>
                                    <label for="memnametbx">Province</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_cities" required="required" placeholder="email ad" runat="server"></asp:TextBox>
                                    <label for="booknametbx">Cities/Muncipalities</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_fulladdr" required="required" placeholder="fulladdr" runat="server"></asp:TextBox>
                                    <label for="memctnumtbx">Full Address</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <center>
                                    <span class="badge primary-clr text-white text-uppercase">Log in Credentials</span>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_unametbx" required="required" placeholder="pw" runat="server" ReadOnly="True"></asp:TextBox>
                                    <label for="unametbx">Username</label>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="uprofile_passtbx" required="required" placeholder="pw" runat="server"></asp:TextBox>
                                    <%-- TextMode="Password" --%>
                                    <label for="passtbx">Password</label>
                                </div>
                            </div>
                        </div>



                        <div class="row mt-4">
                            <div class="col">
                                <div class="form-group d-grid gap-2 col-6 mx-auto">
                                    <asp:Button class="btn primary-clr btn-lg" ID="uprofile_updatebtn" runat="server" Text="Update" OnClick="uprofile_updatebtn_Click" />
                                </div>
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
                                        <img width="80px" src="images/imgs/books1.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Your Issued Books</h4>
                                        <asp:Label class="badge primary-clr text-light" runat="server" Text="Your books info"></asp:Label>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="usrProfile_SqlDataSource" runat="server"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" ID="usrProfile_GridView" runat="server"></asp:GridView>
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
