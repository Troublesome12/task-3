<?php

/**
 * Created by Reliese Model.
 * Date: Sun, 25 Nov 2018 16:41:08 +0000.
 */

namespace App\Models;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Player
 * 
 * @property int $id
 * @property string $name
 * @property int $team_id
 * @property int $created_by
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Models\Team $team
 * @property \App\Models\User $user
 *
 * @package App\Models
 */
class Player extends Eloquent
{
	protected $casts = [
		'team_id' => 'int',
		'created_by' => 'int'
	];

	protected $fillable = [
		'name',
		'team_id',
		'created_by'
	];

	public function team()
	{
		return $this->belongsTo(\App\Models\Team::class);
	}

	public function user()
	{
		return $this->belongsTo(\App\Models\User::class, 'created_by');
	}
}
