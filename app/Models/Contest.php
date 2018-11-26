<?php

/**
 * Created by Reliese Model.
 * Date: Sun, 25 Nov 2018 16:41:08 +0000.
 */

namespace App\Models;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Contest
 * 
 * @property int $id
 * @property string $name
 * @property int $created_by
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Models\User $user
 * @property \Illuminate\Database\Eloquent\Collection $teams
 *
 * @package App\Models
 */
class Contest extends Eloquent
{
	protected $casts = [
		'created_by' => 'int'
	];

	protected $fillable = [
		'name',
		'created_by'
	];

	public function user()
	{
		return $this->belongsTo(\App\Models\User::class, 'created_by');
	}

	public function teams()
	{
		return $this->hasMany(\App\Models\Team::class);
	}
}
