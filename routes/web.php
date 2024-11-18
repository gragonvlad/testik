<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BalanceController;
use App\Http\Controllers\ChartsController;
use App\Http\Controllers\OfferController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name("/");

Route::get('/home', function () {
    return view('home');
})->name("home");
Route::get('/tr', function () {
	return view('welcome');
});

Route::get('/404', function () {
    return view('404');
})->name("404");

Route::get('/home', [OfferController::class, 'index'])->name("home");

Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register_process', [AuthController::class, 'register'])->name('register_process');

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login_process', [AuthController::class, 'login'])->name('login_process');

Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

Route::post('/disable_user', [UserController::class, 'disableUser'])->name('disable_user');

Route::post('/create_offer', [OfferController::class, 'createOffer'])->name('create_offer');
Route::post('/disable_offer', [OfferController::class, 'disableOffer'])->name('disable_offer');

Route::post('/top_up_balance', [BalanceController::class, 'topUpBalance'])->name('top_up_balance');

Route::post('/sign_up_offer', [OfferController::class, 'signUpOffer'])->name('signUpOffer');

Route::get('/redirect/{id}', [OfferController::class, 'redirect'])->name('redirect');

Route::post('/chart/{id}', [ChartsController::class, 'handleChart'])->name('chart');
