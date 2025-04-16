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
            <nav class="gap-3 navbar navbar-expand">
                <div class="mobile-toggle-icon fs-3">
                    <i class="bi bi-list"></i>
                </div>
                <form class="searchbar">
                    <div class="position-absolute top-50 translate-middle-y search-icon ms-3"><i
                            class="bi bi-search"></i></div>
                    <input class="form-control" type="text" placeholder="Type here to search">
                    <div class="position-absolute top-50 translate-middle-y search-close-icon"><i
                            class="bi bi-x-lg"></i></div>
                </form>
                <div class="top-navbar-right ms-auto">
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item search-toggle-icon">
                            <a class="nav-link" href="#">
                                <div class="">
                                    <i class="bi bi-search"></i>
                                </div>
                            </a>
                        </li>


                        <li class="nav-item dropdown dropdown-large">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#"
                                data-bs-toggle="dropdown">
                                <div class="notifications">
                                    <i class="bi bi-person"></i>
                                    {{ Auth::user()->name }}
                                </div>
                            </a>
                            <div class="p-0 dropdown-menu dropdown-menu-end">
                                <div class="p-2">

                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                        style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!--end top header-->

        <!--start sidebar -->
        <aside class="sidebar-wrapper" data-simplebar="true">
            <div class="sidebar-header">
                <div>
                    <img src="{{ asset('adminfile/images/logo-icon.png') }}" class="logo-icon" alt="logo icon">
                </div>
                <div>
                    <a href="{{ route('dashboard') }}">
                        <h4 class="logo-text">@lang('Admin Panel')</h4>
                    </a>
                </div>
                <div class="toggle-icon ms-auto"> <i class="bi bi-list"></i>
                </div>
            </div>
            <!--navigation-->
            <ul class="metismenu" id="menu">
                <li>
                    <a href="{{ route('dashboard') }}">
                        <div class="parent-icon"><i class="bi bi-house-fill"></i></div>
                        <div class="menu-title">@lang('Dashboard')</div>
                    </a>
                </li>

                <li>
                    <a href="{{ route('officeholiday.index') }}">
                        <div class="parent-icon"><i class="bi bi-add"></i></div>
                        <div class="menu-title">{{ __('Office Holiday List') }}</div>
                    </a>
                </li>

                <li>
                    <a href="{{ route('attendance-process.index') }}">
                        <div class="parent-icon"><i class="bi bi-process"></i></div>
                        <div class="menu-title">{{ __('Attendance Process') }}</div>
                    </a>
                </li>
                <li>
                    <a href="{{ route('report.attendance') }}">
                        <div class="parent-icon"><i class="bi bi-process"></i></div>
                        <div class="menu-title">{{ __('Attendance Report & Edit') }}</div>
                    </a>
                </li>

                <li>
                    <a href="{{ route('report.monthly') }}">
                        <div class="parent-icon"><i class="bi bi-process"></i></div>
                        <div class="menu-title">{{ __('Reports') }}</div>
                    </a>
                </li>
            </ul>
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
