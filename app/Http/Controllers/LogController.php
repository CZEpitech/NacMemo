<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\File;

class LogController extends Controller
{
    public function index()
    {
        // Chemin vers le fichier de log
        $logFile = storage_path('logs/laravel.log');

        // Vérifie si le fichier existe
        if (!File::exists($logFile)) {
            return view('logs.index', ['logs' => 'Le fichier de log est introuvable.']);
        }

        // Lit le contenu du fichier
        $logs = File::get($logFile);

        // Retourne la vue avec les logs
        return view('logs.index', ['logs' => $logs]);
    }
}