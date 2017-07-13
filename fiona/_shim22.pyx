cdef extern from "ogr_api.h":
    int OGR_F_IsFieldNull(void *feature, int n)

from fiona.ogrext2 cimport *

cdef bint is_field_null(void *feature, int n):
    if OGR_F_IsFieldNull(feature, n):
        return True
    elif not OGR_F_IsFieldSet(feature, n):
        return True
    else:
        return False

cdef void* gdal_open_vector(char* path_c, int mode):
    if mode == 1:
        mode = GDAL_OF_UPDATE
    else:
        mode = GDAL_OF_READONLY
    cdef void* cogr_ds = GDALOpenEx(path_c,
            GDAL_OF_VECTOR | mode,
            NULL, NULL, NULL)
    return cogr_ds

cdef void* gdal_create(void* cogr_driver, const char *path_c):
    return GDALCreate(
        cogr_driver,
        path_c,
        0,
        0,
        0,
        GDT_Unknown,
        NULL)