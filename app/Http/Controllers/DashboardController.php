<?php

namespace App\Http\Controllers;
use App\Models\User;
use Auth;
use App\Models\Contest;
use App\Models\Team;
use App\Models\Player;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
	public function getUserInfo(Request $request) {
        $user = $request->session()->get('loggedin_user');
        return response()->json($user);
    }

    public function getAllContests(Request $request) {
        $user = $request->session()->get('loggedin_user');
        $contests = Contest::where('created_by', $user['id'])->with('teams')->get();
        return response()->json($contests);
    }

   	public function getAllTeams(Request $request) {
   		$user = $request->session()->get('loggedin_user');
	    $teams = Team::where('created_by', $user['id'])->with('players')->get();
        return response()->json($teams);
   	}

	public function getPlayerInfo(Request $request) {
		$user = $request->session()->get('loggedin_user');
	    $players = Player::where('players.created_by', $user['id'])
	    		->leftJoin('teams', 'players.team_id', '=', 'teams.id')
	    		->leftJoin('contests', 'teams.contest_id', '=', 'contests.id')
	    		->select('players.*', 'teams.name AS team_name', 'contests.name AS contest_name')
	    		->get();
		return response()->json($players);
   	}
}
