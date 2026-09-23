<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class CheckSystem
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $site_atual = URL::to('/');

        if ($site_atual === $site_atual) {
            return $next($request);
        }

        $retorno = ['msg' => 'Sistema pirateado , por favor entre em contato. whatsapp (066) 99639-8290.'];

        return response()->json($retorno);
    }
}
