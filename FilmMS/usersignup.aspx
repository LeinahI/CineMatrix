<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" EnableEventValidation="false" Inherits="FilmMS.usersignup" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container mt-5 mb-5">
        <div class="row ">
            <div class="col-md-12 mx-auto">

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
                                    <h3>Member Registration</h3>
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
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_fullnametbx" placeholder="fullname" required="required" runat="server"></asp:TextBox>
                                    <label for="usrsnp_fullnametbx">Full Name</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_dobtbx" placeholder="dob" runat="server" required="required" TextMode="Date"></asp:TextBox>
                                    <label for="usrsnp_dobtbx">Date of Birth</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_ctnumtbx" placeholder="0956656" runat="server" required="required" TextMode="Number"></asp:TextBox>
                                    <asp:Label ID="usrsnp_ctnumlbl" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                    <label for="usrsnp_ctnumtbx">Contact Number</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_emladdrtbx" placeholder="eml" runat="server" required="required" TextMode="Email"></asp:TextBox>
                                    <asp:Label ID="usrsnp_emladdrlbl" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                    <label for="usrsnp_emladdrtbx">Email Address</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_ddregion" placeholder="Region" required="required" runat="server"></asp:TextBox>
                                    <label for="usrsnp_ddregion">Region</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_ddprovince" placeholder="Province" required="required" runat="server"></asp:TextBox>
                                    <label for="usrsnp_ddprovince">Province</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_ddcity" placeholder="Cities" required="required" runat="server"></asp:TextBox>
                                    <label for="usrsnp_ddcity">Cities/Muncipalities</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-3">

                            <div class="col-md-12">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_fulladdrtbx" placeholder="fulladdr" required="required" runat="server"></asp:TextBox>
                                    <label for="usrsnp_fulladdrtbx">Full Address</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <center>
                                    <span class="badge secondary-clr text-white text-uppercase">Log in Credentials</span>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-3">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_unametbx" placeholder="uname" required="required" runat="server"></asp:TextBox>
                                    <asp:Label ID="usrsnp_unamelbl" runat="server" Visible="false" ForeColor="Red"></asp:Label>

                                    <label for="usrsnp_unametbx">Username</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrsnp_passtbx" placeholder="pass" runat="server" required="required" TextMode="Password"></asp:TextBox>
                                    <label for="usrsnp_passtbx">Password</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group mt-4 d-grid">
                                    <asp:Button class="btn primary-clr" ID="usrsnp_snpbtn" runat="server" Text="Sign up" OnClick="usrsnp_snpbtn_Click" />
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
