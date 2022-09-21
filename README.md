# TOW

TOW is a tiny OpenGL wrapper written in [Literate](https://github.com/zyedidia/Literate). The Literate code of TOW is not much different from C++, you can read them without any knowledge about Literate. TOW only encapsulates the primary functions of OpenGL but provides more convenient methods with safety and less overhead🚀.

To draw things on the screen, usually, you only need these two objects:  `Framebuffer` and  `Graphicpipeline`,  see the code below for detail.

```C++
// draw a simple triangle
tow::FramebufferPtr fb;
tow::GraphicPipelinePtr pipeline;

void init(){
    using namespace tow;

    fb = Framebuffer::create();

    vec2 vertices[] = { {-1, -1}, {1, -1}, {0, 1} };
    auto layout = VertexLayout::create();
    layout->add("a_position", {GL_FLOAT, 2});
    layout->stride(sizeof(vec2));

    auto bufGroup = BufferGroup::create();
    bufGroup->createBuffer("b_vertex", vertices, {GL_ARRAY_BUFFER, sizeof(vec2), 3});

    pipeline = GraphicPipeline::create({bufGroup, "b_vertex"}, layout);
}

void render(int x, int y, int w, int h){
    fb->bind(x, y, w, h);
    tow::drawArrays(pipeline, GL_TRIANGLES);
}
```

## How to build

On Windows, make sure you have installed vs2017 or later before running premake5.bat.

On other platforms, you should install [premake5](https://premake.github.io/download.html), [make](https://www.gnu.org/software/make/) and [Literate](https://github.com/zyedidia/Literate) corresponding to the platform, and then type in the command:

```C++
make -C lit all
premake5 your_action
```

## How to clone

For most people, enter the command:

```bash
git clone https://github.com/czq1989/tow.git
```

But if you are in China and the cloning speed is slow, you can enter the command:

```bash
git clone https://gitclone.com/github.com/czq1989/tow.git
```

## Examples

### glTF Model Viewer

A viewer that can load [gltf/glb](https://github.com/KhronosGroup/glTF/blob/master/README.md) file, and supports PBR, skin, morph target, and animation. Most files I have tested are from [sketchfab](https://sketchfab.com/3d-models?features=downloadable&sort_by=-likeCount) and [GeneratedAssets](https://github.com/KhronosGroup/glTF-Asset-Generator), however, in order to keep this repository small, I don't put all of them into the assets folder.

![gltf_model_viewer](https://github.com/czq1989/tow/wiki/images/gltf_model_viewer.png)
![gltf_model_viewer](https://github.com/czq1989/tow/wiki/images/gltf_model_viewer_1.png)

### Shader Toy

A simple [shader toy](https://www.shadertoy.com/) emulator that you can write glsl code to implement cool graphic effects.

![shader_toy](https://github.com/czq1989/tow/wiki/images/shader_toy.png)

### UI Editor

An editor that is used to edit game UI elements. If you have a [PSD](https://en.wikipedia.org/wiki/Adobe_Photoshop#File_format) file that all UI elements have already been arranged, drop it into the editor, then you can make some changes again or save it as a JSON file.

![ui_editor](https://github.com/czq1989/tow/wiki/images/ui_editor.png)

### Block World Editor

A block editor like Minecraft, but easier to select and create blocks.

![block_world_editor](https://github.com/czq1989/tow/wiki/images/block_world_editor.png)

### Simple Paint

A simple and fast paint tool based on SDF supports undo, redo and layer blending.

![simple paint](https://github.com/czq1989/tow/wiki/images/simple_paint.png)

## Credits

Thanks to:

* [ocornut/imgui](https://github.com/ocornut/imgui)
* [Dav1dde/glad](https://github.com/Dav1dde/glad)
* [g-truc/glm](https://github.com/g-truc/glm)
* [alco/psdump](https://github.com/alco/psdump)
* [juliettef/IconFontCppHeaders](https://github.com/juliettef/IconFontCppHeaders)
* [syoyo/tinygltf](https://github.com/syoyo/tinygltf)
* [nlohmann/json](https://github.com/nlohmann/json)
* [zyedidia/Literate](https://github.com/zyedidia/Literate)
* [nothings/stb](https://github.com/nothings/stb)
* [glfw/glfw](https://github.com/glfw/glfw)

