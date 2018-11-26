<?php

/**
 * Created by Reliese Model.
 * Date: Sun, 25 Nov 2018 16:41:08 +0000.
 */

namespace App\Models;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Team
 * 
 * @property int $id
 * @property string $name
 * @property int $contest_id
 * @property int $created_by
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Models\Contest $contest
 * @property \App\Models\User $user
 * @property \Illuminate\Database\Eloquent\Collection $players
 *
 * @package App\Models
 */
class Team extends Eloquent
{
	protected $casts = [
		'contest_id' => 'int',
		'created_by' => 'int'
	];

	protected $fillable = [
		'name',
		'contest_id',
		'created_by'
	];

	public function contest()
	{
		return $this->belongsTo(\App\Models\Contest::class);
	}

	public function user()
	{
		return $this->belongsTo(\App\Models\User::class, 'created_by');
	}

	public function players()
	{
		return $this->hasMany(\App\Models\Player::class);
	}
}
