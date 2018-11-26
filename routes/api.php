<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/contests', 'ContestController@getAllContests');
Route::get('/teams/{contestId}', 'ContestController@getTeamByContestId');
Route::get('/players/{teamId}', 'ContestController@getPlayerByTeamId');

Route::post('/login', 'AuthController@login');
Route::get('/checkLoggedInUser', 'AuthController@checkLoggedInUser');
Route::post('/logout', 'AuthController@logout');


Route::get('/dashboard/user', 'DashboardController@getUserInfo');
Route::get('/dashboard/contests', 'DashboardController@getAllContests');
Route::get('/dashboard/teams', 'DashboardController@getAllTeams');
Route::get('/dashboard/player', 'DashboardController@getPlayerInfo');
