using Godot;
using System;

public partial class Bird : CharacterBody2D
{
	[Export]
	public float gravity = 900.00f;

	[Export]
	public float jump_force = 300.00f;

	[Export]
	public int rotation_speed = 2;

	private AnimationPlayer animation_player;

	private float max_speed = 400f;
	private Vector2 _velocity;

	public override void _Ready()
	{
		_velocity = Vector2.Zero;
		animation_player = GetNode<AnimationPlayer>("AnimationPlayer");
	}

	public override void _PhysicsProcess(double delta)
	{
		if (Input.IsActionJustPressed("Jump"))
		{
			Jump();
		}

		_velocity.Y += gravity * (float)delta;

		if (_velocity.Y > max_speed)
		{
			_velocity.Y = max_speed;
		}

		MoveAndCollide(_velocity * (float)delta);
		
		RotateBird();
		
		UpdateVelocity();
	}
	
	private void UpdateVelocity() {
	this.Velocity = _velocity;
	}
	private void Jump()
	{
		_velocity.Y = jump_force;
		Rotation = Mathf.DegToRad(-30);
	}

	private void RotateBird()
	{
		// Rotate downwards when falling
		if (_velocity.Y > 0 && Mathf.RadToDeg(Rotation) < 90)
		{
			Rotation += rotation_speed * Mathf.DegToRad(1);
		}
		// Rotate upwards when flapping
		else if (_velocity.Y < 0 && Mathf.RadToDeg(Rotation) > -30)
		{
			Rotation -= rotation_speed * Mathf.DegToRad(1);
		}
	}
}
