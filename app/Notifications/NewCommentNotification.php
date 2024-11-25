<?php

namespace App\Notifications;

use App\Models\EmailContent;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Log;

class NewCommentNotification extends Notification implements ShouldQueue
{
    use Queueable;

    private $memorial;
    private $comment;

    public function __construct($memorial, $comment)
    {
        $this->memorial = $memorial;
        $this->comment = $comment;
    }

    /**
     * Détermine les canaux de notification utilisés.
     * Cette méthode renvoie un tableau vide si le champ notification_comment est désactivé.
     */
    public function via($notifiable)
    {
        if ($notifiable->notification_comment !== 1) {
            Log::info("Notification non envoyée : l'utilisateur {$notifiable->id} a désactivé les notifications.");
            return []; // Ne pas envoyer la notification
        }

        return ['mail']; // Envoyer par email
    }

    /**
     * Construction de l'email de notification.
     */
    public function toMail($notifiable)
    {
        Log::info("Préparation de l'email pour l'utilisateur {$notifiable->id}.");

        $content = EmailContent::where('key', 'comment_notification')->firstOrFail();

        return (new MailMessage)
            ->subject($content->subject)
            ->view(
                'emails.new-comment-notification',
                [
                    'notifiable' => $notifiable,
                    'memorial' => $this->memorial,
                    'comment' => $this->comment,
                    'content' => $content,
                ]
            );
    }
}