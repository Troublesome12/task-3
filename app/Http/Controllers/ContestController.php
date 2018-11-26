<?php

namespace App\Http\Controllers;
use App\Models\Contest;
use App\Models\Team;
use App\Models\Player;

use Illuminate\Http\Request;

class ContestController extends Controller
{
    public function getAllContests() {
        $contests = Contest::all();
        return response()->json($contests);
    }

   	public function getTeamByContestId($contestId) {
		    $teams = Team::where('contest_id', $contestId)->get();
        return response()->json($teams);
   	}

	   public function getPlayerByTeamId($teamId) {
		    $players = Player::where('team_id', $teamId)->get();
        return response()->json($players);
   	}   	
}