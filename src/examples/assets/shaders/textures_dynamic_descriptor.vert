#version 450
#extension GL_ARB_separate_shader_objects : enable

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;
layout (location = 2) in vec2 uv;

//layout (location = 2) in vec3 normal;
//layout (location = 4) in vec3 tangent;

layout (location = 0) out vec3 out_position;
layout (location = 1) out vec3 out_color;
layout (location = 2) out vec2 out_uv;

layout (set = 0, binding = 1) uniform MaterialData_t
{
    vec3 position;
    float aspect;
    uint index;
} u_material_data;

layout (set = 0, binding = 2) uniform ViewProjection_t
{
    mat4 view;
    mat4 proj;
} u_view_proj;

void main()
{
    out_position = 0.5*position + 0.5;
    out_color = color;
    out_uv = uv;
    gl_Position = u_view_proj.proj * u_view_proj.view * vec4(u_material_data.position + position, 1.0);
    gl_Position.x *= u_material_data.aspect;
    gl_Position.y = -gl_Position.y; // Hack: vulkan's y is down
}
