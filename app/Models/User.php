<?php

/**
 * Created by Reliese Model.
 * Date: Sun, 25 Nov 2018 16:41:08 +0000.
 */

namespace App\Models;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class User
 * 
 * @property int $id
 * @property string $name
 * @property string $email
 * @property string $password
 * @property string $user_type
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \Illuminate\Database\Eloquent\Collection $contests
 * @property \Illuminate\Database\Eloquent\Collection $players
 * @property \Illuminate\Database\Eloquent\Collection $teams
 *
 * @package App\Models
 */
class User extends Eloquent
{
	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'name',
		'email',
		'password',
		'user_type'
	];

	public function contests()
	{
		return $this->hasMany(\App\Models\Contest::class, 'created_by');
	}

	public function players()
	{
		return $this->hasMany(\App\Models\Player::class, 'created_by');
	}

	public function teams()
	{
		return $this->hasMany(\App\Models\Team::class, 'created_by');
	}
}
