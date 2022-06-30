#ifndef MODEL_H
#define MODEL_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Model
{
    float*    vertices;
    uint32_t  vertex_count;
    uint8_t   is_indexed;
    uint64_t  vertex_buffer_offset;
    uint16_t* indices;
    uint32_t  index_count;
    uint64_t  index_buffer_offset;
} Model;

void clear_model(Model * model);
void CalcNormal(float N[3], float v0[3], float v1[3], float v2[3]);
void get_file_data(char const * filename, char ** data, size_t * len);
int  load_obj(float bmin[3], float bmax[3], char const * filename, Model * out_model);

#ifdef __cplusplus
}
#endif

#endif
