cdef extern from "ogr_api.h":
    int OGR_F_IsFieldNull(void *feature, int n)

from fiona.ogrext2 cimport OGR_F_IsFieldSet

cdef bint is_field_null(void *feature, int n):
    if OGR_F_IsFieldNull(feature, n):
        return True
    elif not OGR_F_IsFieldSet(feature, n):
        return True
    else:
        return False
