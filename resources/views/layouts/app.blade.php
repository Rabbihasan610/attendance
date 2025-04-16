<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> @yield('title')</title>
<meta name="csrf-token" content="{{ csrf_token() }}">
<link rel="icon" href="" type="image/png" />

<!--plugins-->
<link href="{{ asset('adminfile') }}/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />


<!-- Bootstrap CSS -->
<link href="{{ asset('adminfile') }}/css/bootstrap.min.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/bootstrap-extended.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/style.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/icons.css" rel="stylesheet">
<link href="{{ asset('adminfile') }}/css/custom.css" rel="stylesheet" />


<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<!-- loader-->
<link href="{{ asset('adminfile') }}/css/pace.min.css" rel="stylesheet" />
<!--Theme Styles-->
<link href="{{ asset('adminfile') }}/css/dark-theme.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/light-theme.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/semi-dark.css" rel="stylesheet" />
<link href="{{ asset('adminfile') }}/css/header-colors.css" rel="stylesheet" />



@stack('css')

<body>
    <!--start wrapper-->
    <div class="wrapper">
        <!--start top header-->
        <header class="top-header">
            <nav class="navbar navbar-expand gap-3">
                <div class="mobile-toggle-icon fs-3">
                    <i class="bi bi-list"></i>
                </div>
                <div class="top-navbar-right ms-auto">
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item search-toggle-icon">
                            <a class="nav-link" href="#">
                                <div class="">
                                    <i class="bi bi-search"></i>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Student List</a>
                        </li>
                    </ul>

                    <li>
                        <a href="#">
                            <div class="parent-icon"><i class="bi bi-edit"></i>
                            </div>
                            <div class="menu-title">Cache Clear</div>
                        </a>
                    </li>

                    <!--end navigation-->
                    </aside>
                    <!--end sidebar -->

                    <!--start content-->
                    <main class="page-content">


                        @yield('content')

                        @stack('delete')


                    </main>
                    <!--end page main-->

                </div>
                <!--end wrapper-->

                <!--plugins-->
                <script src="{{ asset('adminfile') }}/js/jquery.min.js"></script>
                <script src="{{ asset('adminfile') }}/js/bootstrap.bundle.min.js"></script>
                <script src="{{ asset('adminfile') }}/plugins/simplebar/js/simplebar.min.js"></script>
                <script src="{{ asset('adminfile') }}/plugins/metismenu/js/metisMenu.min.js"></script>
                <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <!--app-->
                <script src="{{ asset('adminfile') }}/js/app.js"></script>


</body>

</html>
