<?php

namespace App\Http\Controllers;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function login(Request $request) {
        // $email = Input::get('email');
        // $password = bcrypt(Input::get('password'));
        $user = array(
            'email' => $request->get('email'),
            'password' => $request->get('password')
        );

        // $user = User::where('email', $email)->where('password', $password)->first();
        // Auth::loginUsingId($user->id, TRUE);

        if(Auth::attempt($user)) {
            $request->session()->put('loggedin_user', Auth::user());
            return response()->json(Auth::user());
        }
        return response()->json(false);
    }

    public function checkLoggedInUser(Request $request) {
        if($request->session()->has('loggedin_user'))
            return response()->json($request->session()->get('loggedin_user'));
        return response()->json(false);
    }

    public function logout(Request $request) {
        if ($request->session()->has('loggedin_user'))
            $request->session()->forget('loggedin_user');
        return response()->json(200);
    }
}