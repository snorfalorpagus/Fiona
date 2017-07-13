#from fiona.ogrext2 cimport OGR_F_IsFieldSet
from fiona.ogrext2 cimport *

cdef bint is_field_null(void *feature, int n):
    if not OGR_F_IsFieldSet(feature, n):
        return True
    else:
        return False
