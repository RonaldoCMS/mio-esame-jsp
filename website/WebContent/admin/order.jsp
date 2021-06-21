<!DOCTYPE html>
<html lang="en">
<%@ include file="./includes/controllAdmin.jsp" %>
<jsp:include page="includes/header.jsp"/>

<body id="page-top">
    <div id="wrapper">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Danubbios Admin</div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>custumers</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="buttons.html">Add custumer</a>
                        <a class="collapse-item active" href="cards.html">alter custumer</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="utilities-color.html">Add order</a>
                        <a class="collapse-item" href="utilities-border.html">Del order</a>
                        <a class="collapse-item" href="utilities-animation.html">Alter order</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFounder"
                    aria-expanded="true" aria-controls="collapseFounder">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Apparels</span>
                </a>
                <div id="collapseFounder" class="collapse" aria-labelledby="headingFounder"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="utilities-color.html">Add apparels</a>
                        <a class="collapse-item" href="utilities-border.html">Del apparels</a>
                        <a class="collapse-item" href="utilities-animation.html">Alter apparels</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>logs</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>exit</span></a>
            </li>
            <hr class="sidebar-divider d-none d-md-block">
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

          

        </ul>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                        <form>
                            <p>Add Order</p>
                            <hr>
                            <div class="form-row">
                              <div class="form-group col-md-6">
                                <label for="input">Articuled Code</label>
                                <input type="email" class="form-control" id="inputEmail4" placeholder="Name">
                              </div>
                              <div class="form-group col-md-6">
                                <label for="inputPassword4">fiscal Code</label>
                                <input type="password" class="form-control" id="inputPassword4" placeholder="Surname">
                              </div>
                            </div>
                            <div class="form-group">
                              <label for="inputAddress">Address</label>
                              <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                            </div>
                            <button type="submit" class="btn btn-primary">Continue</button>
                          </form>
                        </div>

                        <div class="col-2">
                            <form>
                                <p>Delete order</p>
                                <hr>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="inputAddress">id order</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                                      </div>
                                </div>
                                <button type="submit" class="btn btn-primary">delete</button>
                              </form>
                            </div>
                            <div class="col">
                                <form>
                                    <p>Alter Order</p>
                                    <hr>
                                    <div class="form-row">
                                      <div class="form-group col-md-6">
                                        <label for="input">id order</label>
                                        <input type="email" class="form-control" id="inputEmail4" placeholder="Name">
                                      </div> 
                                    </div>
                                    <div class="form-group">
                                      <label for="inputAddress">Address</label>
                                      <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">delivered</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="YYYY-MM-DD">
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">review</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                                      </div>
                                    <button type="submit" class="btn btn-primary">Continue</button>
                                  </form>
                                </div>
        
                    </div>
                    <div class="row">
                        <div class="col-lg-6 mb-4">
                    </div>
                </div>
            </div>
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="includes/footer.jsp"></jsp:include>

</body>

</html>