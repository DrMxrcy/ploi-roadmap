<?php

namespace App\Http\Livewire;

use App\Models\User;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Http\Livewire\Concerns\CanNotify;
use Livewire\Component;
use Filament\Forms;

class Profile extends Component implements HasForms
{
    use InteractsWithForms, CanNotify;

    public $name;
    public $email;
    public User $user;

    public function mount(): void
    {
        $this->user = auth()->user();

        $this->form->fill([
            'name' => $this->user->name,
            'email' => $this->user->email,
        ]);
    }

    protected function getFormSchema(): array
    {
        return [
            Forms\Components\Card::make([
                Forms\Components\TextInput::make('name')->required(),
                Forms\Components\TextInput::make('email')->required()->email(),
            ])
        ];
    }

    public function submit(): void
    {
        $data = $this->form->getState();

        $this->user->update([
            'name' => $data['name'],
            'email' => $data['email'],
        ]);

        $this->notify('success', 'Profile has been saved.');
    }

    public function logout()
    {
        auth()->logout();

        return redirect()->route('home');
    }

    public function render()
    {
        return view('livewire.profile');
    }
}