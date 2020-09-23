#include <iostream>
#include <Siv3D.hpp>

void Main()
{
	Font f(50);
	while (System::Update())
	{
		f(U"hello").draw(Scene::Center());
	}
}
