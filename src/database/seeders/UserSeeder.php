<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $email = env('SEED_ADMIN_EMAIL');
        $password = env('SEED_ADMIN_PASSWORD');

        if (empty($email) || empty($password)) {
            return;
        }

        User::updateOrCreate(
            ['email' => $email],
            [
                'name' => env('SEED_ADMIN_NAME', 'Administrador'),
                'is_admin' => 'S',
                'password' => bcrypt($password),
            ]
        );
    }
}
