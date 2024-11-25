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

    public function via($notifiable)
    {
        if ($notifiable->notification_comment) {
            Log::info('User has notifications enabled.', ['user_id' => $notifiable->id]);
            return ['mail'];
        }

        Log::info('User notifications are disabled.', ['user_id' => $notifiable->id]);
        return [];
    }

    public function toMail($notifiable)
    {
        Log::info("Preparing email for user.", ['user_id' => $notifiable->id]);

        $content = EmailContent::where('key', 'comment_notification')->firstOrFail();

        return (new MailMessage)
            ->subject($content->subject)
            ->view(
                'emails.new-comment-notification',
                [
                    'notifiable' => $notifiable,
                    'memorial' => $this->memorial,
                    'comment' => $this->comment,
                    'content' => $content
                ]
            );
    }
}

